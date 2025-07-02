<?php

require_once 'vendor/autoload.php';

use Mugesh\Calculator\Calculator;

$calc = new Calculator();

echo "=== Mugesh Calculator Demo ===\n\n";

// Basic operations
echo "Addition: 10 + 5 = " . $calc->add(10, 5) . "\n";
echo "Subtraction: 10 - 3 = " . $calc->subtract(10, 3) . "\n";
echo "Multiplication: 4 * 6 = " . $calc->multiply(4, 6) . "\n";
echo "Division: 20 / 4 = " . $calc->divide(20, 4) . "\n\n";

// Advanced operations
echo "Percentage: 15% of 200 = " . $calc->percentage(200, 15) . "\n";
echo "Power: 2^8 = " . $calc->power(2, 8) . "\n";
echo "Square root: √64 = " . $calc->sqrt(64) . "\n";

// Error handling example
try {
    echo "Division by zero test: ";
    $calc->divide(10, 0);
} catch (InvalidArgumentException $e) {
    echo "Error caught: " . $e->getMessage() . "\n";
}
