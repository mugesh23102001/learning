<?php

namespace Mugesh\Calculator\Tests;

use PHPUnit\Framework\TestCase;
use Mugesh\Calculator\Calculator;
use InvalidArgumentException;

class CalculatorTest extends TestCase
{
    private Calculator $calculator;

    protected function setUp(): void
    {
        $this->calculator = new Calculator();
    }

    public function testAdd()
    {
        $this->assertEquals(5, $this->calculator->add(2, 3));
        $this->assertEquals(0, $this->calculator->add(-2, 2));
        $this->assertEquals(-5, $this->calculator->add(-2, -3));
    }

    public function testSubtract()
    {
        $this->assertEquals(2, $this->calculator->subtract(5, 3));
        $this->assertEquals(-4, $this->calculator->subtract(-2, 2));
        $this->assertEquals(1, $this->calculator->subtract(-2, -3));
    }

    public function testMultiply()
    {
        $this->assertEquals(15, $this->calculator->multiply(3, 5));
        $this->assertEquals(0, $this->calculator->multiply(0, 5));
        $this->assertEquals(6, $this->calculator->multiply(-2, -3));
    }

    public function testDivide()
    {
        $this->assertEquals(2, $this->calculator->divide(10, 5));
        $this->assertEquals(2.5, $this->calculator->divide(5, 2));
        $this->assertEquals(-2, $this->calculator->divide(-10, 5));
    }

    public function testDivideByZero()
    {
        $this->expectException(InvalidArgumentException::class);
        $this->expectExceptionMessage('Division by zero is not allowed');
        $this->calculator->divide(10, 0);
    }

    public function testPercentage()
    {
        $this->assertEquals(20, $this->calculator->percentage(100, 20));
        $this->assertEquals(15, $this->calculator->percentage(50, 30));
    }

    public function testPower()
    {
        $this->assertEquals(8, $this->calculator->power(2, 3));
        $this->assertEquals(1, $this->calculator->power(5, 0));
        $this->assertEquals(0.25, $this->calculator->power(2, -2));
    }

    public function testSqrt()
    {
        $this->assertEquals(3, $this->calculator->sqrt(9));
        $this->assertEquals(5, $this->calculator->sqrt(25));
        $this->assertEquals(0, $this->calculator->sqrt(0));
    }

    public function testSqrtNegativeNumber()
    {
        $this->expectException(InvalidArgumentException::class);
        $this->expectExceptionMessage('Cannot calculate square root of negative number');
        $this->calculator->sqrt(-4);
    }
}
