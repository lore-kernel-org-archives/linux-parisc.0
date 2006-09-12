From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] [RFC]: rename ncr53c8xx to 53c720? [Was: D380 and
	ext[23] fs grave pb]
Date: Tue, 12 Sep 2006 07:26:22 -0500
Message-ID: <200609120726.23020.mszick@morethan.org>
References: <45018CEC.4040104@scarlet.be> <45069555.60807@scarlet.be>
	<200609120702.18615.mszick@morethan.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200609120702.18615.mszick@morethan.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue September 12 2006 07:02, Michael S. Zick wrote:
> On Tue September 12 2006 06:09, Joel Soete wrote:
> > Hello Matthew,
> > 
> > May be now that parisc-linux tree is managed with git and that driver is 
> > in fact only for ncr 53c720 hba, isn't it time to rename those stuff 
> > like ncr53c8xx to 53c720?
> >
> 
> Joel and group,
> 
> I was browsing that code and noticed that it tries to support a half
> dozen different chips.
> 
> That leads into some really strange looking code for the single-ended/
> differential setup.
> 

Oops, sorry, getting old...

Noticed one more thing - the driver allocates kernel memory -

Which raised the question in my mind of:
*) Driver allocates memory
*) Memory request generates swap activity
*) Swap file is on same driver

Can the above sequence happen and deadlock the driver?
The "softlockup detected" in your message listing?

That driver also uses both spinlocks and timers, so
it may be affected by the recent changes.

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
