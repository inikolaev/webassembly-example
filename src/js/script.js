function js_invert(data) {
    for (var i = 0; i < data.length; i += 4) {
        data[i] = 255 - data[i];
        data[i + 1] = 255 - data[i + 1];
        data[i + 2] = 255 - data[i + 2];
    }
}

function js_grayscale_averaging(data) {
    for (var i = 0; i < data.length; i += 4) {
        const gray = (data[i] + data[i + 1] + data[i + 2]) / 3;

        data[i] = gray;
        data[i + 1] = gray;
        data[i + 2] = gray;
    }
}

function js_grayscale_luminance(data) {
    for (var i = 0; i < data.length; i += 4) {
        const gray = data[i] * 0.3 + data[i + 1] * 0.59 + data[i + 2] * 0.11;

        data[i] = gray;
        data[i + 1] = gray;
        data[i + 2] = gray;
    }
}

function js_grayscale_desaturation(data) {
    for (var i = 0; i < data.length; i += 4) {
        const red = data[i];
        const green = data[i + 1];
        const blue = data[i + 2];

        const gray = (Math.min(red, green, blue) + Math.max(red, green, blue)) / 2;

        data[i] = gray;
        data[i + 1] = gray;
        data[i + 2] = gray;
    }
}

function js_grayscale_decomposition_min(data) {
    for (var i = 0; i < data.length; i += 4) {
        const gray = Math.min(data[i], data[i + 1], data[i + 2]);

        data[i] = gray;
        data[i + 1] = gray;
        data[i + 2] = gray;
    }
}

function js_grayscale_decomposition_max(data) {
    for (var i = 0; i < data.length; i += 4) {
        const gray = Math.max(data[i], data[i + 1], data[i + 2]);

        data[i] = gray;
        data[i + 1] = gray;
        data[i + 2] = gray;
    }
}

function js_grayscale_dithering(data, width, height) {
    const numberOfShades = 16;
    const conversionFactor = Math.floor(255 / (numberOfShades - 1));

    const grayLookup = new Uint8Array(255 * 3 + 1);
    for (var i = 0; i < 766; i++) {
        grayLookup[i] = i / 3;
    }

    for (let y = 0; y < height; y++) {
        let error = 0;

        for (let x = 0; x < width; x++) {
            const i = (x + y * width) << 2;

            const red = data[i];
            const green = data[i + 1];
            const blue = data[i + 2];

            const gray = grayLookup[red + green + blue] + error;
            //const grayTempCalc = Math.round((Math.round(gray / conversionFactor) + 0.5) * conversionFactor);
            const grayTempCalc = conversionFactor * Math.round(gray / conversionFactor) + Math.round(conversionFactor / 2);

            error = gray - grayTempCalc;

            const newGray = grayTempCalc > 255 ? 255 : grayTempCalc < 0 ? 0 : grayTempCalc;

            data[i] = newGray;
            data[i + 1] = newGray;
            data[i + 2] = newGray;
        }
    }
}

function js_gaussian_blur(data, width, height) {
    const radius = 2;
    const radius2 = radius * radius;
    const square = 2 * Math.PI * radius2;
    var rs = Math.ceil(radius * 2.57);     // significant radius
    for (var i = 0; i < height; i++)
        for(var j = 0; j < width; j++) {
            var val = 0, wsum = 0;
            for(var iy = i-rs; iy<i+rs+1; iy++)
                for(var ix = j-rs; ix<j+rs+1; ix++) {
                    var x = Math.min(width - 1, Math.max(0, ix));
                    var y = Math.min(height - 1, Math.max(0, iy));
                    var dsq = (ix-j)*(ix-j)+(iy-i)*(iy-i);
                    var wght = Math.exp( -dsq / radius2 ) / square;
                    val += data[4*y*width+4*x] * wght;  wsum += wght;
                }
            data[4*i*width+4*j] = Math.round(val/wsum);            
        }
}