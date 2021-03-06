#ifndef _SCREEN_UTILS_H
#define _SCREEN_UTILS_H

#include <stdlib.h>
#include <stdbool.h>

#include <common/types.h>

struct table_row_formatter_t
{
    char *buffer;
    size_t buflen;
    size_t offset;
    bool dynamic;
};

bool table_row_formatter_append(
    struct table_row_formatter_t *const this,
    const char *fmt, ...);
void table_row_formatter_free(
    struct table_row_formatter_t *const this);
char *table_row_formatter_get(
    struct table_row_formatter_t *const this,
    size_t *length);
void table_row_formatter_init(
    struct table_row_formatter_t *const this,
    char *const buffer,
    size_t length);
void table_row_formatter_init_dynamic(
    struct table_row_formatter_t *const this,
    size_t initial_size);
void table_row_formatter_reset(
    struct table_row_formatter_t *const this);

bool table_row_formatter_append_ex(
    struct table_row_formatter_t *const this,
    const colour_t fgcolour,
    const colour_t bgcolour,
    const table_column_alignment_t alignment,
    const char *fmt, ...);

colour_t hsv_to_rgb(
    float h,
    const float s,
    const float v);

/* calculate luminance in fixed-point 0.8 format */
uint8_t luminance(const colour_t colour);

colour_t get_text_colour(const colour_t background);

#endif
