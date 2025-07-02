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
