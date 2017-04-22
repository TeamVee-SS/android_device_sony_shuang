/*
 * Copyright (C) 2016 The CyanogenMod Project
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

#define CAMERA_PARAMETERS_EXTRA_C \
    const char CameraParameters::SCENE_MODE_SOFT_SNAP[] = "soft-snap"; \
    const char CameraParameters::SCENE_MODE_ANTI_MOTION_BLUR[] = "anti-motion-blur"; \
    const char CameraParameters::SCENE_MODE_HAND_HELD_TWILIGHT[] = "hand-held-twilight"; \
    const char CameraParameters::SCENE_MODE_HIGH_SENSITIVITY[] = "high-sensitivity"; \
    const char CameraParameters::SCENE_MODE_GOURMENT[] = "gourment"; \
    const char CameraParameters::SCENE_MODE_PET[] = "pet"; \
    const char CameraParameters::SCENE_MODE_DOCUMENT[] = "document"; \

#define CAMERA_PARAMETERS_EXTRA_H \
    static const char SCENE_MODE_SOFT_SNAP[]; \
    static const char SCENE_MODE_ANTI_MOTION_BLUR[]; \
    static const char SCENE_MODE_HAND_HELD_TWILIGHT[]; \
    static const char SCENE_MODE_HIGH_SENSITIVITY[]; \
    static const char SCENE_MODE_GOURMENT[]; \
    static const char SCENE_MODE_PET[]; \
    static const char SCENE_MODE_DOCUMENT[]; \
