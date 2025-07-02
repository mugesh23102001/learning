#!/bin/bash

# Bash script to create PHP package structure
echo "🚀 Creating PHP Package Structure..."

# Create directories
mkdir -p src tests .vscode

echo "📝 Creating composer.json..."
cat > composer.json << 'EOF'
{
    "name": "yourname/example-package",
    "description": "An example PHP package for Packagist",
    "type": "library",
    "license": "MIT",
    "authors": [
        {
            "name": "Your Name",
            "email": "your.email@example.com"
        }
    ],
    "minimum-stability": "stable",
    "require": {
        "php": ">=7.4"
    },
    "require-dev": {
        "phpunit/phpunit": "^9.0"
    },
    "autoload": {
        "psr-4": {
            "YourName\\ExamplePackage\\": "src/"
        }
    },
    "autoload-dev": {
        "psr-4": {
            "YourName\\ExamplePackage\\Tests\\": "tests/"
        }
    },
    "keywords": [
        "php",
        "library",
        "example",
        "packagist"
    ],
    "homepage": "https://github.com/yourname/example-package",
    "support": {
        "issues": "https://github.com/yourname/example-package/issues",
        "source": "https://github.com/yourname/example-package"
    },
    "scripts": {
        "test": "phpunit"
    }
}
EOF

echo "🧮 Creating src/Calculator.php..."
cat > src/Calculator.php << 'EOF'
<?php

namespace mugesh\calculator;

/**
 * A simple calculator class for demonstration
 */
class Calculator
{
    /**
     * Add two numbers
     *
     * @param float $a
     * @param float $b
     * @return float
     */
    public function add(float $a, float $b): float
    {
        return $a + $b;
    }

    /**
     * Subtract two numbers
     *
     * @param float $a
     * @param float $b
     * @return float
     */
    public function subtract(float $a, float $b): float
    {
        return $a - $b;
    }

    /**
     * Multiply two numbers
     *
     * @param float $a
     * @param float $b
     * @return float
     */
    public function multiply(float $a, float $b): float
    {
        return $a * $b;
    }

    /**
     * Divide two numbers
     *
     * @param float $a
     * @param float $b
     * @return float
     * @throws \InvalidArgumentException
     */
    public function divide(float $a, float $b): float
    {
        if ($b == 0) {
            throw new \InvalidArgumentException('Division by zero is not allowed');
        }
        
        return $a / $b;
    }

    /**
     * Calculate percentage
     *
     * @param float $value
     * @param float $percentage
     * @return float
     */
    public function percentage(float $value, float $percentage): float
    {
        return ($value * $percentage) / 100;
    }
}
EOF

echo "🔤 Creating src/StringHelper.php..."
cat > src/StringHelper.php << 'EOF'
<?php

namespace mugesh\calculator;

/**
 * String utility helper class
 */
class StringHelper
{
    /**
     * Convert string to slug format
     *
     * @param string $text
     * @return string
     */
    public static function slug(string $text): string
    {
        // Replace non letter or digits by -
        $text = preg_replace('~[^\pL\d]+~u', '-', $text);
        
        // Transliterate
        $text = iconv('utf-8', 'us-ascii//TRANSLIT', $text);
        
        // Remove unwanted characters
        $text = preg_replace('~[^-\w]+~', '', $text);
        
        // Trim
        $text = trim($text, '-');
        
        // Remove duplicate -
        $text = preg_replace('~-+~', '-', $text);
        
        // Lowercase
        $text = strtolower($text);
        
        return empty($text) ? 'n-a' : $text;
    }

    /**
     * Truncate string to specified length
     *
     * @param string $text
     * @param int $length
     * @param string $suffix
     * @return string
     */
    public static function truncate(string $text, int $length = 100, string $suffix = '...'): string
    {
        if (strlen($text) <= $length) {
            return $text;
        }
        
        return substr($text, 0, $length) . $suffix;
    }

    /**
     * Check if string starts with given prefix
     *
     * @param string $haystack
     * @param string $needle
     * @return bool
     */
    public static function startsWith(string $haystack, string $needle): bool
    {
        return substr($haystack, 0, strlen($needle)) === $needle;
    }

    /**
     * Check if string ends with given suffix
     *
     * @param string $haystack
     * @param string $needle
     * @return bool
     */
    public static function endsWith(string $haystack, string $needle): bool
    {
        return substr($haystack, -strlen($needle)) === $needle;
    }
}
EOF

echo "🧪 Creating tests/CalculatorTest.php..."
cat > tests/CalculatorTest.php << 'EOF'
<?php

namespace mugesh\calculator\Tests;

use PHPUnit\Framework\TestCase;
use mugesh\calculator\Calculator;

class CalculatorTest extends TestCase
{
    private $calculator;

    protected function setUp(): void
    {
        $this->calculator = new Calculator();
    }

    public function testCanCreateCalculatorInstance()
    {
        $this->assertInstanceOf(Calculator::class, $this->calculator);
    }

    public function testCanAddTwoNumbers()
    {
        $result = $this->calculator->add(5, 3);
        $this->assertEquals(8, $result);
    }

    public function testCanSubtractTwoNumbers()
    {
        $result = $this->calculator->subtract(10, 4);
        $this->assertEquals(6, $result);
    }

    public function testCanMultiplyTwoNumbers()
    {
        $result = $this->calculator->multiply(6, 7);
        $this->assertEquals(42, $result);
    }

    public function testCanDivideTwoNumbers()
    {
        $result = $this->calculator->divide(15, 3);
        $this->assertEquals(5, $result);
    }

    public function testDivisionByZeroThrowsException()
    {
        $this->expectException(\InvalidArgumentException::class);
        $this->expectExceptionMessage('Division by zero is not allowed');
        
        $this->calculator->divide(10, 0);
    }

    public function testCanCalculatePercentage()
    {
        $result = $this->calculator->percentage(200, 15);
        $this->assertEquals(30, $result);
    }

    public function testCanWorkWithFloatingPointNumbers()
    {
        $result = $this->calculator->add(1.5, 2.3);
        $this->assertEquals(3.8, $result);
    }
}
EOF

echo "🔤 Creating tests/StringHelperTest.php..."
cat > tests/StringHelperTest.php << 'EOF'
<?php

namespace mugesh\calculator\Tests;

use PHPUnit\Framework\TestCase;
use mugesh\calculator\StringHelper;

class StringHelperTest extends TestCase
{
    public function testCanCreateSlugFromString()
    {
        $result = StringHelper::slug('Hello World! This is a Test');
        $this->assertEquals('hello-world-this-is-a-test', $result);
    }

    public function testCanCreateSlugFromStringWithSpecialCharacters()
    {
        $result = StringHelper::slug('Café & Restaurant #1');
        $this->assertEquals('cafe-restaurant-1', $result);
    }

    public function testCanTruncateString()
    {
        $text = 'This is a very long text that needs to be truncated';
        $result = StringHelper::truncate($text, 20);
        $this->assertEquals('This is a very long ...', $result);
    }

    public function testTruncateDoesNotTruncateShortString()
    {
        $text = 'Short text';
        $result = StringHelper::truncate($text, 20);
        $this->assertEquals('Short text', $result);
    }

    public function testCanTruncateWithCustomSuffix()
    {
        $text = 'This is a long text';
        $result = StringHelper::truncate($text, 10, '---');
        $this->assertEquals('This is a ---', $result);
    }

    public function testCanCheckIfStringStartsWith()
    {
        $this->assertTrue(StringHelper::startsWith('Hello World', 'Hello'));
        $this->assertFalse(StringHelper::startsWith('Hello World', 'World'));
    }

    public function testCanCheckIfStringEndsWith()
    {
        $this->assertTrue(StringHelper::endsWith('Hello World', 'World'));
        $this->assertFalse(StringHelper::endsWith('Hello World', 'Hello'));
    }

    public function testStartsWithEmptyString()
    {
        $this->assertTrue(StringHelper::startsWith('Hello', ''));
    }

    public function testEndsWithEmptyString()
    {
        $this->assertTrue(StringHelper::endsWith('Hello', ''));
    }
}
EOF

echo "⚙️ Creating phpunit.xml..."
cat > phpunit.xml << 'EOF'
<?xml version="1.0" encoding="UTF-8"?>
<phpunit xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:noNamespaceSchemaLocation="https://schema.phpunit.de/9.3/phpunit.xsd"
         bootstrap="vendor/autoload.php"
         colors="true"
         verbose="true">
    <coverage processUncoveredFiles="true">
        <include>
            <directory suffix=".php">./src</directory>
        </include>
        <exclude>
            <directory>./tests</directory>
            <directory>./vendor</directory>
        </exclude>
    </coverage>
    <testsuites>
        <testsuite name="Package Test Suite">
            <directory>tests</directory>
        </testsuite>
    </testsuites>
    <logging>
        <log type="coverage-html" target="build/coverage"/>
        <log type="coverage-text" target="php://stdout" showUncoveredFiles="false"/>
    </logging>
</phpunit>
EOF

echo "📄 Creating README.md..."
cat > README.md << 'EOF'
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
EOF

echo "📄 Creating LICENSE..."
cat > LICENSE << 'EOF'
MIT License

Copyright (c) 2025 Your Name

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF

echo "📄 Creating CHANGELOG.md..."
cat > CHANGELOG.md << 'EOF'
# Changelog

All notable changes to `example-package` will be documented in this file.

## [Unreleased]

## [1.0.0] - 2025-07-02

### Added
- Initial release
- Calculator class with basic arithmetic operations
- StringHelper class with utility methods
- Complete test suite with PHPUnit
- Documentation and examples

### Features
- Add, subtract, multiply, divide operations
- Percentage calculations
- String slug generation
- String truncation
- String prefix/suffix checking
- Full PSR-4 autoloading support
- Comprehensive unit tests

## Security
- Division by zero protection in Calculator class
EOF

echo "🚫 Creating .gitignore..."
cat > .gitignore << 'EOF'
# Composer
/vendor/
composer.lock

# PHPUnit
/build/
/.phpunit.result.cache
phpunit.xml.dist
.phpunit.cache

# IDE files
.idea/
.vscode/
*.swp
*.swo
*~

# OS generated files
.DS_Store
.DS_Store?
._*
.Spotlight-V100
.Trashes
ehthumbs.db
Thumbs.db

# Logs
*.log

# Runtime data
pids
*.pid
*.seed

# Coverage directory used by tools like istanbul
coverage/

# Dependency directories
node_modules/

# Optional npm cache directory
.npm

# Optional REPL history
.node_repl_history

# Environment variables
.env
.env.local
.env.*.local
EOF

echo ""
echo "✅ PHP Package structure created successfully!"
echo ""
echo "📁 Created structure:"
echo "   ├── src/"
echo "   │   ├── Calculator.php"
echo "   │   └── StringHelper.php"
echo "   ├── tests/"
echo "   │   ├── CalculatorTest.php"
echo "   │   └── StringHelperTest.php"
echo "   ├── composer.json"
echo "   ├── phpunit.xml"
echo "   ├── README.md"
echo "   ├── LICENSE"
echo "   ├── CHANGELOG.md"
echo "   └── .gitignore"
echo ""
echo "🚀 Next steps:"
echo "1. Run 'composer install'"
echo "2. Customize composer.json with your details"
echo "3. Run 'composer test' to run tests"
echo "4. Initialize git: 'git init && git add . && git commit -m \"Initial commit\"'"
echo "5. Push to GitHub and submit to Packagist"
echo ""