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
