#include "tables.h"

void table_init(
    struct table_t *ctx,
    const struct table_column_t *columns,
    const uint8_t column_count,
    const coord_int_t row_height)
{
    ctx->columns = columns;
    ctx->column_count = column_count;
    ctx->row_height = row_height;
    ctx->x0 = 0;
    ctx->row_offset = 0;
}

void table_start(
    struct table_t *ctx,
    const coord_int_t x0,
    const coord_int_t y0)
{
    ctx->x0 = x0;
    ctx->row_offset = y0;
}

static inline utf8_cstr_t table_cell(
    const struct font_t *font,
    const coord_int_t row_height,
    utf8_cstr_t content,
    const struct table_column_t *column,
    const colour_t fgcolour,
    const colour_t bgcolour,
    coord_int_t x,
    coord_int_t y)
{
    const coord_int_t yrect = y-(font->height-1);
    fill_rectangle(
        x, yrect,
        x+column->width-1, yrect+row_height-1,
        bgcolour);
    switch (column->alignment) {
    case TABLE_ALIGN_RIGHT:
    {
        coord_int_t width, height, depth;
        font_text_metrics(
            font,
            content,
            &width, &height, &depth);
        if (width < column->width) {
            // text will fit, so we can do right alignment
            x += (column->width - width);
            return font_draw_text(
                font,
                x, y,
                fgcolour,
                content);
        }
        break;
    }
    case TABLE_ALIGN_CENTER:
    {
        coord_int_t width, height, depth;
        font_text_metrics(
            font,
            content,
            &width, &height, &depth);
        if (width < column->width) {
            // text will fit, so we can do center alignment
            x += (column->width - width) / 2;
            return font_draw_text(
                font,
                x, y,
                fgcolour,
                content);
        }
        break;
    }
    default:
    case TABLE_ALIGN_LEFT:
    {
        // drawing happens at the end
        break;
    }
    }
    return font_draw_text_ellipsis(
        font,
        x, y,
        fgcolour,
        content,
        column->width);
}

void table_row(
    struct table_t *ctx,
    const struct font_t *font,
    const utf8_cstr_t *columns,
    const colour_t fgcolour,
    const colour_t bgcolour)
{
    coord_int_t x = ctx->x0;
    coord_int_t y = ctx->row_offset;

    const utf8_cstr_t *column_text = columns;
    const struct table_column_t *column_decl = ctx->columns;
    for (unsigned int i = 0; i < ctx->column_count; i++) {
        table_cell(
            font, ctx->row_height,
            *column_text, column_decl,
            fgcolour, bgcolour,
            x, y);

        x += column_decl->width;

        column_text++;
        column_decl++;
    }

    ctx->row_offset = y + ctx->row_height;
}

void table_row_onebuffer(
    struct table_t *ctx,
    const struct font_t *font,
    utf8_cstr_t columns,
    const colour_t fgcolour,
    const colour_t bgcolour)
{
    coord_int_t x = ctx->x0;
    coord_int_t y = ctx->row_offset;

    const struct table_column_t *column_decl = ctx->columns;
    for (unsigned int i = 0; i < ctx->column_count; i++) {
        columns = table_cell(
            font, ctx->row_height,
            columns, column_decl,
            fgcolour, bgcolour,
            x, y);

        x += column_decl->width;

        columns++;
        column_decl++;
    }

    ctx->row_offset = y + ctx->row_height;
}
