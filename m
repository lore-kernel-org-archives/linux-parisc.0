From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] Expect defunct, kill -9 panics kernel?
Date: Sat, 10 Feb 2007 19:50:07 -0600
Message-ID: <1171158607.3373.54.camel__18701.2046845213$1416624280$gmane$org@mulgrave.il.steeleye.com>
References: <200702101937.l1AJb7Uo014941@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain
Cc: dave.anglin@nrc.ca,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200702101937.l1AJb7Uo014941@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, 2007-02-10 at 14:37 -0500, John David Anglin wrote:
> > 0x10 looks to be curr->func implying curr is NULL and thus the queue
> > task_list is corrupt.
> 
> Do you think it help to add a check in __wake_up for a NULL pointer?

I suppose so ... I'd really like someone to validate my guess though,
although an additional BUG_ON() can't hurt.

James


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
