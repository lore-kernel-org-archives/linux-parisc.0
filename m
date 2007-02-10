From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Expect defunct, kill -9 panics kernel?
Date: Sat, 10 Feb 2007 12:35:44 -0600
Message-ID: <1171132545.3373.36.camel__696.42470120943$1416624283$gmane$org@mulgrave.il.steeleye.com>
References: <119aab440702100916q504101b1xe99f65ff5945e712@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: John David Anglin <dave.anglin@nrc.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440702100916q504101b1xe99f65ff5945e712@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, 2007-02-10 at 12:16 -0500, Carlos O'Donell wrote:
> At what point in the process life are we in __wake_up and
> __wake_up_common?
> An address of 0x10 is very suspicious.

Almost every internal kernel event or semaphore uses these.

Because of the empty backtrace, I'd be inclined to say it was the
scheduler, possibly.

0x10 looks to be curr->func implying curr is NULL and thus the queue
task_list is corrupt.

That's the best I can do without the kernel to pull apart.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
