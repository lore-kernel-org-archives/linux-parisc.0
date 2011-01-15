From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Git kernel trees for parisc
Date: Sat, 15 Jan 2011 09:21:24 -0600
Message-ID: <1295104884.5973.10.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
To: Parisc List <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

OK, I finally got them put together.  I'll try to use a more standard
workflow (like kyle did) ... this, unfortunately means that none of my
standard scripts worked, so I had to redo them all.

The current tree is here:

http://git.kernel.org/?p=linux/kernel/git/jejb/parisc-2.6.git

All branches are stored as topic ones with <topic> as the head and
<topic>-base as the base.  The current set of topics are

fixes - long lived topic branch for various fixes
for-next - topic for pulling into linux-next
tmpalias-flush - the current set of tmpalias flush patches.

In addition, the patches and changelogs which comprise each topic will
be available here:

http://www.kernel.org/pub/linux/kernel/people/jejb/parisc-2.6-<topic>.diff
http://www.kernel.org/pub/linux/kernel/people/jejb/parisc-2.6-<topic>.changelog

James


