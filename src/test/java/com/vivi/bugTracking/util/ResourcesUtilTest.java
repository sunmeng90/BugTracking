package com.vivi.bugTracking.util;


import org.junit.Test;

import java.io.IOException;
import java.net.URISyntaxException;
import java.util.List;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

public class ResourcesUtilTest {

    @Test
    public void testGetResoruce() throws IOException, URISyntaxException {
        List<String> lines = ResourcesUtil.readList("anonymousURL.txt");
        assertNotNull(lines);
        assertTrue(lines.size() > 0);
    }
}
