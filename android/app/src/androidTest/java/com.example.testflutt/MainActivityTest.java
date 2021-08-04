// Change this line to YOUR package name:
package com.example.testflutt;

import androidx.test.rule.ActivityTestRule;
import dev.flutter.plugins.integration_test.FlutterTestRunner;
import org.junit.Rule;
import org.junit.runner.Rungit With;
// Import MainActivity from YOUR package
import com.example.testflutt.MainActivity;

@RunWith(FlutterTestRunner.class)
public class MainActivityTest {
    @Rule
    public ActivityTestRule<MainActivity> rule = new ActivityTestRule<>(MainActivity.class, true, false);
}