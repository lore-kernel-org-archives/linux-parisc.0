From: Matthew Wilcox <matthew@wil.cx>
Subject: [parisc-linux] Git tree rebased
Date: Tue, 31 Oct 2006 08:00:01 -0700
Message-ID: <20061031150001.GB26964@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@parisc-linux.org
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


So, as discussed previously [1], I've just rebased the git tree on top of
Linus' 2.6.19-rc4.  You can see our old history on the devel-2006-10-31
branch [2], but our shiny new history is on master, and conveniently at
the top for easy reading of what we haven't merged yet.

If your remotes file currently has a line in it like:

	Pull: refs/heads/master:refs/heads/origin

then you'll want to add the '+' at the beginning:

	Pull: +refs/heads/master:refs/heads/origin

otherwise git will refuse to update.  With the +, it will complain, but
do it anyway.


[1] http://lists.parisc-linux.org/pipermail/parisc-linux/2006-October/030326.html
[2] http://git.parisc-linux.org/?p=linux-2.6.git;a=shortlog;h=devel-2006-10-31
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
