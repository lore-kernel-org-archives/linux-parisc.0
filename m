From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] Problem with atomicity of TIF for parisc ?
Date: Sun, 11 Mar 2007 21:24:04 +0100
Message-ID: <200703112124.05035.deller__22159.9314049401$1416624325$gmane$org@gmx.de>
References: <200703100006.l2A06o7Y012173@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_lVG9FBdoYxCezR9"
Cc: parisc-linux@lists.parisc-linux.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200703100006.l2A06o7Y012173@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

--Boundary-00=_lVG9FBdoYxCezR9
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Dave,

On Saturday 10 March 2007, John David Anglin wrote:
> > Now I'm wondering if our thread-problems may be due the fact that we do not disable interrupts while testing the TIF_XX values in arch/parisc/kernel/entry.S, e.g.:
> 
> Do you have a testcase?  

Randolph pointed me once to the thread_test2.c testprogram in parisc's 'userspace' CVS repository.
Source is attached, but I haven't tested it since a few weeks...

> I'm still seeing the occasional thread test 
> fail in the GCC testsuite fail.  These are usually timeouts.  I'm not
> seeing hung processes leading to a kernel crash anymore ;)

Me neither.

Helge


--Boundary-00=_lVG9FBdoYxCezR9
Content-Type: text/plain;
  charset="iso-8859-1";
  name="thread_test2.c"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="thread_test2.c"

/* gcc -Wall -O2 -o thread_test2 thread_test2.c -lpthread */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <pthread.h>
#include <sys/types.h>
#include <sys/wait.h>

pthread_cond_t started, terminated;
pthread_mutex_t started_lock, terminated_lock;
pthread_t thread;

static void *threadfunc(void *data)
{
	int *count = (int *)data;
	pid_t pid;
	int status;

	printf("Thread %d started\n", *count);

	pthread_cond_signal(&started);
	pid = fork();
	switch (pid) {
		case 0: /* Child */
			printf("Process %d started\n", *count);
			sleep(1);
			exit(10);
			break;

		case -1: /* Error */
			perror("fork");
			return NULL;
	}

	printf("Waiting on pid %d\n", pid);
	pid = waitpid(-1, &status, 0);
	if (pid < 0) {
		perror("waitpid");
		return NULL;
	}

	printf("Thread %d terminated (%d)\n", *count, WEXITSTATUS(status));
	pthread_cond_signal(&terminated);

	pthread_exit(NULL);

	return 0;
}

int main(int argc, char **argv)
{
	int count, ret;

	for (count = 1; ; count++) {
		ret = pthread_cond_init(&started, NULL);
		if (ret) {
			perror("pthread_cond_init(started)");
			break;
		}

		ret = pthread_mutex_init(&started_lock, NULL);
		if (ret) {
			perror("pthread_mutex_init(started_lock)");
			break;
		}

		ret = pthread_cond_init(&terminated, NULL);
		if (ret) {
			perror("pthread_cond_init(terminated)");
			break;
		}

		ret = pthread_mutex_init(&terminated_lock, NULL);
		if (ret) {
			perror("pthread_mutex_init(terminated_lock)");
			break;
		}

		ret = pthread_create(&thread, NULL, threadfunc, &count);
		if (ret) {
			perror("pthread_create");
			break;
		}

		pthread_mutex_lock(&started_lock);
		do {
			ret = pthread_cond_wait(&started, &started_lock);
		} while (ret != 0);
		pthread_mutex_unlock(&started_lock);
		
		pthread_mutex_destroy(&started_lock);
		pthread_cond_destroy(&started);

		pthread_mutex_lock(&terminated_lock);
		do {
			ret = pthread_cond_wait(&terminated, &terminated_lock);
		} while (ret != 0);
		pthread_mutex_unlock(&terminated_lock);

		pthread_mutex_destroy(&terminated_lock);
		pthread_cond_destroy(&terminated);
	}

	return 0;
}

--Boundary-00=_lVG9FBdoYxCezR9
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
--Boundary-00=_lVG9FBdoYxCezR9--
