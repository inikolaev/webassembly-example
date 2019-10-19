float PI = 3.14159;

float js_exp(float a);

int rnd(float n) {
    int lo = n;
    return n - lo >= 0.5 ? lo + 1 : lo;
}

unsigned char min(unsigned char a, unsigned char b, unsigned char c) {
    int m = a < b ? a : b;
    return m < c ? m : c;
}

unsigned char max(unsigned char a, unsigned char b, unsigned char c) {
    int m = a < b ? b : a;
    return m < c ? c : m;
}

void wasm_invert(unsigned char *data, int width, int height) {
    int size = 4 * width * height;

    for (int i = 0; i < size; i += 4) {
        data[i] = 255 - data[i];
        data[i + 1] = 255 - data[i + 1];
        data[i + 2] = 255 - data[i + 2];
    }
}

void wasm_grayscale_averaging(unsigned char *data, int width, int height) {
    int size = 4 * width * height;

    for (int i = 0; i < size; i += 4) {
        unsigned char gray = (data[i] + data[i + 1] + data[i + 2]) / 3;

        data[i] = gray;
        data[i + 1] = gray;
        data[i + 2] = gray;
    }
}

void wasm_grayscale_luminance(unsigned char *data, int width, int height) {
    int size = 4 * width * height;

    for (int i = 0; i < size; i += 4) {
        unsigned char gray = data[i] * 0.3 + data[i + 1] * 0.59 + data[i + 2] * 0.11;

        data[i] = gray;
        data[i + 1] = gray;
        data[i + 2] = gray;
    }
}

void wasm_grayscale_desaturation(unsigned char *data, int width, int height) {
    int size = 4 * width * height;

    for (int i = 0; i < size; i += 4) {
        unsigned char red = data[i];
        unsigned char green = data[i + 1];
        unsigned char blue = data[i + 2];

        unsigned char gray = (min(red, green, blue) + max(red, green, blue)) / 2;

        data[i] = gray;
        data[i + 1] = gray;
        data[i + 2] = gray;
    }
}

void wasm_grayscale_decomposition_min(unsigned char *data, int width, int height) {
    int size = 4 * width * height;

    for (int i = 0; i < size; i += 4) {
        unsigned char gray = min(data[i], data[i + 1], data[i + 2]);

        data[i] = gray;
        data[i + 1] = gray;
        data[i + 2] = gray;
    }
}

void wasm_grayscale_decomposition_max(unsigned char *data, int width, int height) {
    int size = 4 * width * height;

    for (int i = 0; i < size; i += 4) {
        unsigned char gray = max(data[i], data[i + 1], data[i + 2]);

        data[i] = gray;
        data[i + 1] = gray;
        data[i + 2] = gray;
    }
}

void wasm_grayscale_dithering(unsigned char *data, int width, int height) {
    unsigned char numberOfShades = 16;
    int conversionFactor = 255 / (numberOfShades - 1);

    unsigned char *grayLookup = (unsigned char *) (4 * width * height);
    for (int i = 0; i < 766; i++) {
        grayLookup[i] = i / 3;
    }

    for (int y = 0; y < height; y++) {
        int error = 0;
        
        for (int x = 0; x < width; x++) {
            int i = (x + y * width) << 2;

            unsigned char red = data[i];
            unsigned char green = data[i + 1];
            unsigned char blue = data[i + 2];
            
            int gray = grayLookup[red + green + blue] + error;
            //int grayTempCalc = rnd((rnd(gray / conversionFactor) + 0.5) * conversionFactor);
            int grayTempCalc = conversionFactor * rnd(gray / conversionFactor) + rnd(conversionFactor / 2);

            error = gray - grayTempCalc;

            unsigned char newGray = grayTempCalc > 255 ? 255 : grayTempCalc < 0 ? 0 : grayTempCalc;
            data[i] = newGray;
            data[i + 1] = newGray;
            data[i + 2] = newGray;
        }
    }
}

void wasm_gaussian_blur(unsigned char *data, int width, int height) {
    int radius = 2;
    int radius2 = radius * radius;
    float square = 2 * PI * radius2;
    int rs = ((int)(radius * 2.57)) + 1;     // significant radius
    for (int i = 0; i < height; i++)
        for(int j = 0; j < width; j++) {
            float val = 0, wsum = 0;
            for(int iy = i-rs; iy<i+rs+1; iy++)
                for(int ix = j-rs; ix<j+rs+1; ix++) {
                    int x = min(width - 1, width - 1, max(0, 0, ix));
                    int y = min(height - 1, height - 1, max(0, 0, iy));
                    int dsq = (ix-j)*(ix-j)+(iy-i)*(iy-i);
                    float wght = js_exp( -dsq / radius2 ) / square;
                    val += data[4*y*width+4*x] * wght;  wsum += wght;
                }
            data[4*i*width+4*j] = rnd(val/wsum);            
        }
}
