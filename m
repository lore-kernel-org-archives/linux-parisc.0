From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] This ones for you ggg! (fixed dpkg)
Date: Fri, 11 Jun 2004 15:37:16 -0400
Message-ID: <20040611193716.GI29203@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


ggg,

Tired of dpkg hosing your system? In place untarring hurting when the
untar fails? No more worries! New dpkg only untars properly when it's
sure to pass!

Would you care to test, or rather would anyone care to test, a new
improved dpkg that forces a dry-run unpack before the actual unpack.
That way corrupted tarballs don't hose your system.

I think dpkg should be more robust so I made it so...

http://parisc-linux.org/~carlos/debian-work/dpkg/

The only way to make dpkg better is:

0. Make the above dry-run check an option so dpkg runs faster
   at the expense of less checking.
1. Try to unpack control.tar.gz to get an idea of the md5sum
2. Add another ar archive member with md5sum inside.
 - Bump deb to version 3.0

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
