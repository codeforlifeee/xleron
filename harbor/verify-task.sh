
set -e  # Exit on error

echo "================================================"
echo "Harbor Task Verification: json-filter-sort"
echo "================================================"
echo ""

# Clean up previous test results
echo "🧹 Cleaning up previous test results..."
rm -rf jobs/test-oracle jobs/test-nop

echo "Installation & Linting"
echo "------------------------"
echo "Running: uvx ruff check harbor_tasks/json-filter-sort"
uvx ruff check harbor_tasks/json-filter-sort
echo "Linting passed!"
echo ""

echo "Running Oracle Test (should return 1.0)"
echo "------------------------"
uv run harbor run --agent oracle --path harbor_tasks/json-filter-sort --job-name test-oracle
echo ""

# Check Oracle result
ORACLE_RESULT=$(python3 -c "import json; data=json.load(open('jobs/test-oracle/result.json')); print(data['stats']['evals']['oracle__adhoc']['metrics'][0]['mean'])")
echo "Oracle Result: $ORACLE_RESULT"
if [ "$ORACLE_RESULT" == "1.0" ]; then
    echo " Oracle test PASSED (1.0)"
else
    echo " Oracle test FAILED (expected 1.0, got $ORACLE_RESULT)"
    exit 1
fi
echo ""

echo "🧪 Running NOP Test (should return 0.0)"
echo "------------------------"
uv run harbor run --agent nop --path harbor_tasks/json-filter-sort --job-name test-nop
echo ""

# Check NOP result
NOP_RESULT=$(python3 -c "import json; data=json.load(open('jobs/test-nop/result.json')); print(data['stats']['evals']['nop__adhoc']['metrics'][0]['mean'])")
echo "NOP Result: $NOP_RESULT"
if [ "$NOP_RESULT" == "0.0" ]; then
    echo " NOP test PASSED (0.0)"
else
    echo " NOP test FAILED (expected 0.0, got $NOP_RESULT)"
    exit 1
fi
echo ""

echo "================================================"
echo "All Tests Passed!"
echo "================================================"
