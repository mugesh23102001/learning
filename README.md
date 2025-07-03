# Mugesh Calculator

[![Latest Version on Packagist](https://img.shields.io/packagist/v/mugesh/calculator.svg?style=flat-square)](https://packagist.org/packages/mugesh/calculator)
[![Total Downloads](https://img.shields.io/packagist/dt/mugesh/calculator.svg?style=flat-square)](https://packagist.org/packages/mugesh/calculator)
[![Monthly Downloads](https://img.shields.io/packagist/dm/mugesh/calculator.svg?style=flat-square)](https://packagist.org/packages/mugesh/calculator)
[![Daily Downloads](https://img.shields.io/packagist/dd/mugesh/calculator.svg?style=flat-square)](https://packagist.org/packages/mugesh/calculator)
[![PHP Version Required](https://img.shields.io/packagist/php-v/mugesh/calculator.svg?style=flat-square)](https://packagist.org/packages/mugesh/calculator)
[![License on Packagist](https://img.shields.io/packagist/l/mugesh/calculator.svg?style=flat-square)](https://packagist.org/packages/mugesh/calculator)

[![Build Status](https://github.com/mugesh/calculator/actions/workflows/test.yml/badge.svg)](https://github.com/mugesh/calculator/actions)
[![Last Commit](https://img.shields.io/github/last-commit/mugesh/calculator.svg?style=flat-square)](https://github.com/mugesh/calculator/commits)
[![Open Issues](https://img.shields.io/github/issues/mugesh/calculator.svg?style=flat-square)](https://github.com/mugesh/calculator/issues)
[![Pull Requests](https://img.shields.io/github/issues-pr/mugesh/calculator.svg?style=flat-square)](https://github.com/mugesh/calculator/pulls)
[![GitHub Stars](https://img.shields.io/github/stars/mugesh/calculator.svg?style=flat-square)](https://github.com/mugesh/calculator/stargazers)
[![GitHub Forks](https://img.shields.io/github/forks/mugesh/calculator.svg?style=flat-square)](https://github.com/mugesh/calculator/network)


# Mugesh Calculator

A simple and lightweight calculator package for PHP that provides basic arithmetic operations.

## Installation

You can install this package via Composer:

```bash
composer require mugesh/calculator
```

## Usage

```php
<?php
require_once 'vendor/autoload.php';

use Mugesh\Calculator\Calculator;

$calc = new Calculator();

// Basic operations
echo $calc->add(5, 3);        // 8
echo $calc->subtract(10, 4);  // 6
echo $calc->multiply(6, 7);   // 42
echo $calc->divide(15, 3);    // 5

// Advanced operations
echo $calc->percentage(200, 15);  // 30 (15% of 200)
echo $calc->power(2, 8);          // 256
echo $calc->sqrt(64);             // 8
```

## Available Methods

- `add(float $a, float $b): float` - Addition
- `subtract(float $a, float $b): float` - Subtraction
- `multiply(float $a, float $b): float` - Multiplication
- `divide(float $a, float $b): float` - Division (throws exception for division by zero)
- `percentage(float $value, float $percentage): float` - Percentage calculation
- `power(float $base, float $exponent): float` - Power calculation
- `sqrt(float $number): float` - Square root (throws exception for negative numbers)

## Testing

Run the test suite:

```bash
composer test
```

Or using PHPUnit directly:

```bash
vendor/bin/phpunit
```

## Requirements

- PHP 7.4 or higher

## License

This package is open-sourced software licensed under the [MIT license](LICENSE).
