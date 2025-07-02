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
