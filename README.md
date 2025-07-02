# Example Package

[![Latest Version on Packagist](https://img.shields.io/packagist/v/yourname/example-package.svg?style=flat-square)](https://packagist.org/packages/yourname/example-package)
[![Tests](https://img.shields.io/github/actions/workflow/status/yourname/example-package/run-tests.yml?branch=main&label=tests&style=flat-square)](https://github.com/yourname/example-package/actions/workflows/run-tests.yml)
[![Total Downloads](https://img.shields.io/packagist/dt/yourname/example-package.svg?style=flat-square)](https://packagist.org/packages/yourname/example-package)

An example PHP package that demonstrates basic functionality including a Calculator class and String helper utilities. Perfect for learning how to create and publish PHP packages to Packagist.

## Installation

You can install the package via composer:

```bash
composer require yourname/example-package
```

## Usage

### Calculator Class

```php
use mugesh\calculator\Calculator;

$calculator = new Calculator();

// Basic arithmetic operations
echo $calculator->add(5, 3);        // 8
echo $calculator->subtract(10, 4);  // 6  
echo $calculator->multiply(6, 7);   // 42
echo $calculator->divide(15, 3);    // 5

// Calculate percentage
echo $calculator->percentage(200, 15); // 30
```

### String Helper

```php
use mugesh\calculator\StringHelper;

// Create URL-friendly slugs
echo StringHelper::slug('Hello World!'); // 'hello-world'

// Truncate strings
echo StringHelper::truncate('This is a long text', 10); // 'This is a ...'

// Check string prefixes and suffixes
var_dump(StringHelper::startsWith('Hello World', 'Hello')); // true
var_dump(StringHelper::endsWith('Hello World', 'World'));   // true
```

## Testing

Run the tests with:

```bash
composer test
```

Or run PHPUnit directly:

```bash
vendor/bin/phpunit
```

## License

The MIT License (MIT). Please see [License File](LICENSE.md) for more information.
