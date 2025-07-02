<?php

namespace Mugesh\Calculator;

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

    /**
     * Calculate power
     *
     * @param float $base
     * @param float $exponent
     * @return float
     */
    public function power(float $base, float $exponent): float
    {
        return pow($base, $exponent);
    }

    /**
     * Calculate square root
     *
     * @param float $number
     * @return float
     * @throws \InvalidArgumentException
     */
    public function sqrt(float $number): float
    {
        if ($number < 0) {
            throw new \InvalidArgumentException('Cannot calculate square root of negative number');
        }
        
        return sqrt($number);
    }
}
