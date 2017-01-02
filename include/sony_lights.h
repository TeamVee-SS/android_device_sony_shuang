/*
 * Copyright (C) 2012-2013 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// Backlight
char const *const LCD_BACKLIGHT_FILE     = "/sys/class/leds/lcd-backlight/brightness";

const int LCD_BRIGHTNESS_MIN = 10;

// SNS/Bar Led
char const *const SNS_LED_FILE           = "/sys/class/leds/lm3533-light-sns/rgb_brightness";

// Notification Led
char const *const RED_LED_FILE          = "/sys/class/leds/red/brightness";
char const *const GREEN_LED_FILE        = "/sys/class/leds/green/brightness";
char const *const BLUE_LED_FILE         = "/sys/class/leds/notification/brightness";
