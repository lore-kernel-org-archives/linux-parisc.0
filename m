From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: [parisc-linux] Does it lakes some cloberred r1 in
Date: Mon, 24 Apr 2006 16:57:19 -0500
Message-ID: <200604241657.19464.mszick@morethan.org>
References: <200604241535.k3OFZmPJ027261@hiauly1.hia.nrc.ca>
	<200604241135.58306.mszick@morethan.org>
	<200604241300.13265.mszick@morethan.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200604241300.13265.mszick@morethan.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon April 24 2006 13:00, Michael S. Zick wrote:
> On Mon April 24 2006 11:35, you wrote:
> > On Mon April 24 2006 10:35, you wrote:
> > > > ldcw,co target_address
> > > > 
> > > > Where target_address includes the magic byte[0] of 
> > > > the cache line.
> > > 
> > > Where is this documented?
> > > 
> > Well, they didn't put it in the instruction RTL where
> > someone could find it.  It is a footnote or mentioned
> > in passing somewhere.
> > 
> > I will look for it, I found it about 5 years ago when
> > Matt and I discussed this on the list, I can find it again.
> > 
> 
I give up - I can not find it now.
Which does not mean it is not there, somewhere.

Ever need to be put to sleep?
Read this:
http://h21007.www2.hp.com/dspp/files/unprotected/parisc20/PA_G_memory_ordering.pdf

In particular, that the semaphore instructions are described as
a load followed (sic: indivisibly) by a store.

Now branch thee here:
http://h21007.www2.hp.com/dspp/files/unprotected/parisc20/PA_6_inst_overview.pdf

Pick section 6-10, physically pages 11 and 12.

Now overlay tables 6-7, 6-8, and 6-9 and note the relationship of cc=01 in all
three tables.

ldw cc=01 <reserved>
stw cc=01 <stw,bc >
ldcw cc=01 <ldcw,co >

This is not an accident, in the days this cpu was designed, silicon did not
grow on trees.

Read thee the paragraphs between table 6-8, and 6-9 - note the special
significance of cache line byte[0] for stw,bc.

But finding that specificly for ldcw,co - even in en_HP - is beyond my
abilities.

Nor do I have a machine where I could simply change the *&^*& spinlock
macro to see if it makes a difference.

I think I will go fishing with Joel,
I am too old to stand for my orals now.

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
