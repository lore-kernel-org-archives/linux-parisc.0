From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] 53c700.c problems with tags?
Date: Thu, 2 Sep 2004 09:45:22 -0600
Message-ID: <20040902154522.GA3060@colo.lackof.org>
References: <Pine.LNX.4.58.0408311232240.2373@localhost>
	<20040902031859.GB24049@colo.lackof.org>
	<Pine.LNX.4.58.0409021240540.2373@localhost>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc <parisc-linux@lists.parisc-linux.org>
To: Jochen Friedrich <jochen@scram.de>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.58.0409021240540.2373@localhost>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Sep 02, 2004 at 12:48:01PM +0200, Jochen Friedrich wrote:
> Thanks. However, my post was not a question how to get rid of the problem
> (my servers are running fine) but just a hint that there might be a bug in
> the tag handling code of 53c700.c.

ah ok. I didn't realize you were trying share another clue as to
what the problem might be. We know there were (are?) problems
with 53c700 tag handling.

>  I didn't really look at the code hard enough, but to me it looks like

Well, I haven't looked at that driver recently...

>  if the tag queue is full, the most likely
> next free tag is searched. If it isn't free, but another tag is, the
> message is printed

The tag number is no guarantee of ordering when using unordered
queue tags (LIFO and FIFO are the other two types of tags).
The driver needs to use some sort of time stamp to determine
tag starvation and not based on which tag numbers happen to be in use.

The message shouldn't be printed unless a tag doesn't complete for a while.
e.g. 3 seconds or more after other tagged IOs (which started later) have
completed.

> and some badness happens and the kernel halts.

My guess is the "tag starvation" message implies assumptions
about how unordered tags work are wrong. Someone needs to review
the allocation/deallocation of IO requests to make sure the driver
don't assume the next/prev tag is not used.

> Setting the queue depth to 1 always fixes the problem, because the drive
> has no chance to reorder the tags.
> 
> Setting the queue depth to something as big as 128 also fixes the problem,
> because the queue never gets that full.

ok - thanks for the addional info.

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
