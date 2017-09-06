# Bitmap editor

This app is a simple bitmap editor that can accept a file containing a list
of commands, and output an ASCII bitmap to the console.

# Configuration

The following commands are understood by the editor.

- **I M N** - Create a new M x N image with all pixels coloured white (O).
- **C** - Clears the table, setting all pixels to white (O).
- **L X Y C** - Colours the pixel (X,Y) with colour C.
- **V X Y1 Y2 C** - Draw a vertical segment of colour C in column X between rows Y1 and Y2 (inclusive).
- **H X1 X2 Y C** - Draw a horizontal segment of colour C in row Y between columns X1 and X2 (inclusive).
- **S** - Show the contents of the current image

# Running

Provide the filename to the editor as follows:

```
> bin/bitmap_editor examples/show.txt
```

# Future features

With more time, it would be nice to implement features such as:

- Extract the console output into a `ConsoleFormatter` class, then implement other
`Formatter` subclasses, such as `HtmlFormatter` or `ImageFormatter` that can write the
bitmap data in other ways.
- Allow a proper console editor that continuously updates the bitmap as you enter
commands directly into the console. Perhaps using [Terminal cursor manipulation](https://github.com/piotrmurach/tty-cursor)
and colouring.
- Currently the bitmap array is mutated. It would be nicer to make it immutable so
that the state can be stored for undo/redo.
