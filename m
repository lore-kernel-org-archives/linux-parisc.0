Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1E4CF482D
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Feb 2003 12:00:13 -0700 (MST)
Date: Tue, 11 Feb 2003 20:00:06 +0100
Message-ID: <3E4844100000055D@ocpmta7.freegates.net>
In-Reply-To: <3E481EBE00000086@ocpmta3.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] pppd, pthread and hppa-linux question?
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
	"Randolph Chung" <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hi all,

>
>>
>>On Mon, Feb 10, 2003 at 08:13:04AM -0800, Randolph Chung wrote:
>>> > All seems to work fine, never the less I notice some pppd messages
which
>>> > I do not noticed on my i386 Debian GNU/Linux box:
>>> > ...
>>> > Feb 10 17:34:57 fw01 pppd[1543]: read: Resource temporarily unavailable
>>> > Feb 10 17:34:57 fw01 pppd[1543]: read /dev/ppp: Resource temporarily
>>unavailable
>>> 
>>> this probably comes from apps that assume EAGAIN==EWOULDBLOCK. we need
>>> to probably fix this in glibc.... let's add it to Carlos' todo list!
:-)
>>
>>It's already in my TODO :)
>>
>>-- snip --
>>- EWOULDBLOCK emulation
>>        = Is EWOULDBLOCK emulation required?
>>        = What happens if we alias EWOULDBLOCK as EAGAIN
>>        = from the kernel hearders?
>>        - Break HPUX compat?
>>-- snip --
>>
>>As JDA notes we still have broken atomic functions in atomicity. Which
>>we are planning to fix with a light weight syscall.
>>
Awaiting this Carlos work, I suggest following workaround:

--- ppp-2.4.1.uus.orig/pppd/sys-linux.c
+++ ppp-2.4.1.uus/pppd/sys-linux.c
@@ -929,7 +933,7 @@
 	    fd = ppp_dev_fd;
     }
     if (write(fd, p, len) < 0) {
-	if (errno == EWOULDBLOCK || errno == ENOBUFS
+	if (errno == EWOULDBLOCK || errno == EAGAIN || errno == ENOBUFS
 	    || errno == ENXIO || errno == EIO || errno == EINTR)
 	    warn("write: warning: %m (%d)", errno);
 	else
@@ -993,7 +997,8 @@
     nr = -1;
     if (ppp_fd >= 0) {
 	nr = read(ppp_fd, buf, len);
-	if (nr < 0 && errno != EWOULDBLOCK && errno != EIO && errno != EINTR)
+	if (nr < 0 && errno != EWOULDBLOCK && errno !=EAGAIN \
+                   && errno != EIO && errno != EINTR)
 	    error("read: %m");
 	if (nr < 0 && errno == ENXIO)
 	    return 0;
@@ -1001,7 +1006,8 @@
     if (nr < 0 && new_style_driver && ifunit >= 0) {
 	/* N.B. we read ppp_fd first since LCP packets come in there. */
 	nr = read(ppp_dev_fd, buf, len);
-	if (nr < 0 && errno != EWOULDBLOCK && errno != EIO && errno != EINTR)
+	if (nr < 0 && errno != EWOULDBLOCK && errno !=EAGAIN \
+                   && errno != EIO && errno != EINTR)
 	    error("read /dev/ppp: %m");
 	if (nr < 0 && errno == ENXIO)
 	    return 0;
@@ -1035,7 +1041,7 @@
     if (n == 0)
 	fatal("eof on loopback");
 
-    if (errno != EWOULDBLOCK)
+    if (errno != EWOULDBLOCK && errno != EAGAIN)
 	fatal("read from loopback: %m(%d)", errno);
 
     return rv;

It seems to me to avoid to much annoying messages.

Do you think I woul have to open a pr near debian maintainer pkg?

Joel


---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be
