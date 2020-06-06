#include <errno.h>
#include <error.h>
#include <unistd.h>

const char poweroff_path[] = "/sbin/poweroff";

int main (int argc, char **argv) {
	if (execv(poweroff_path, argv) < 0)
		error(1, errno, "execv");

	// Won't be reached
	return 0;
}
