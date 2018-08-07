package com.vivi.bugTracking.util;

import java.io.IOException;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

public class ResourcesUtil {
    public static List<String> readList(String file) throws URISyntaxException, IOException {
        Path filePath = Paths.get(ResourcesUtil.class.getClassLoader().getResource(file).toURI());
        return Files.readAllLines(filePath);
    }
}
