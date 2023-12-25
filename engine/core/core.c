#include "core/core.h"
#include "module/module.h"

extern void loop();

static void error_callback(int error, const char *description) {
   fprintf(stderr, "Error: %s\n", description);
}

int main(void) {
   printf("core\n");
   module();
   loop();

   GLFWwindow *window;

   glfwSetErrorCallback(error_callback);

   // This effectively just changes the GLFW platform priority list to use Wayland over X11
   if (glfwPlatformSupported(GLFW_PLATFORM_WAYLAND))
      glfwInitHint(GLFW_PLATFORM, GLFW_PLATFORM_WAYLAND);

   if (!glfwInit())
      exit(EXIT_FAILURE);

   int platform = glfwGetPlatform();
   switch (platform) {
      case GLFW_PLATFORM_X11:
         printf("X11\n");
         break;
      case GLFW_PLATFORM_WAYLAND:
         printf("Wayland\n");
         break;
      case GLFW_PLATFORM_NULL:
         printf("Null\n");
         break;
   }

   window = glfwCreateWindow(640, 480, "Window", NULL, NULL);
   if (!window) {
      glfwTerminate();
      exit(EXIT_FAILURE);
   }

   glfwMakeContextCurrent(window);

   while (!glfwWindowShouldClose(window)) {
      glfwSwapBuffers(window);
      glfwPollEvents();
   }

   glfwDestroyWindow(window);

   glfwTerminate();

   exit(EXIT_SUCCESS);
}
