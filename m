From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: [parisc-linux] parisc git tree up and running
Date: Sat, 13 Aug 2005 10:42:27 -0500
Message-ID: <1123947747.5115.10.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain
To: PARISC list <parisc-linux@lists.parisc-linux.org>
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

I used to run bitkeeper trees for the convenience of those who needed to
check bitkeeper on current parisc.  I've been a bit remiss since
bitkeeper went away, but I've finally got the parisc trees into git.
Like their prior bitkeeper counterparts, they're simply shadow copies of
the imported parisc patch sets, not full copies of our cvs tree
(primarily because keeping a full copy would be too much work and I
can't be bothered). Also, I only merge up to Linus' head when I feel
like it rather than every time he pushes something.

They're browseable here:

http://www.parisc-linux.org/cgi-bin/gitweb.pl

and available for download here:

rsync://www.parisc-linux.org/~jejb/git/parisc-2.6.git

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
