% File: test_asu.pl

% Test Case 1: Valid Output with Normal Parameters
expected_output_normal([
    "|    A    S    U    |",
    "|   A A  SSS   U U  |",
    "|  AAAAA S      UUU  |",
    "| A     A   S    U   |",
    "|A       A   SSS UUU |"
]).

test_asu_normal :-
    expected_output_normal(Expected),
    asu(2, 1, 1, 3, Actual),  % Call the predicate with normal values
    (Actual == Expected -> 
        writeln('Test 1: Valid drawing test passed');
        writeln('Test 1: Valid drawing test failed: Output did not match expected')
    ).

% Test Case 2: Boundary Condition (Impossible to Draw)
test_asu_boundary_1 :-
    asu(0, 0, 0, 0, Result),
    (Result == "no" -> 
        writeln('Test 2: Boundary condition 1 test passed');
        writeln('Test 2: Boundary condition 1 test failed: "no" was expected')
    ).

% Test Case 3: Edge Case with Minimum Font Size (Edge Case)
expected_output_min_font([
    "| A S U |",
    "|AAA   U|"
]).

test_asu_min_font :-
    expected_output_min_font(Expected),
    asu(1, 1, 1, 1, Actual),
    (Actual == Expected -> 
        writeln('Test 3: Minimum font size test passed');
        writeln('Test 3: Minimum font size test failed: Output did not match expected')
    ).

% Test Case 4: Large Font Size
expected_output_large_font([
    "|     A       S       U     |",
    "|    A A     SSS     U   U   |",
    "|   AAAAA   S       U     U  |",
    "|  A     A    SSS   U     U  |",
    "| A       A       S   UUUUU  |"
]).

test_asu_large_font :-
    expected_output_large_font(Expected),
    asu(5, 5, 2, 5, Actual),
    (Actual == Expected -> 
        writeln('Test 4: Large font size test passed');
        writeln('Test 4: Large font size test failed: Output did not match expected')
    ).

% Test Case 5: Custom Spacing and Margins
expected_output_custom([
    "|     A       S       U     |",
    "|    A A     SSS     U   U   |",
    "|   AAAAA   S       U     U  |",
    "|  A     A    SSS   U     U  |",
    "| A       A       S   UUUUU  |"
]).

test_asu_custom :-
    expected_output_custom(Expected),
    asu(3, 2, 4, 3, Actual),
    (Actual == Expected -> 
        writeln('Test 5: Custom spacing and margins test passed');
        writeln('Test 5: Custom spacing and margins test failed: Output did not match expected')
    ).

% Run all tests
run_tests :-
    writeln('Running all tests:'),
    test_asu_normal,
    test_asu_boundary_1,
    test_asu_min_font,
    test_asu_large_font,
    test_asu_custom,
    writeln('All tests finished.').

