From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [parisc-linux] User space locks -- what's wrong
Date: Mon, 12 Jun 2006 11:31:24 -0400
Message-ID: <119aab440606120831y3937faf0y969cbe6dd12226d6@mail.gmail.com>
References: <119aab440606111942o1be5e11bw6ede4fa941f01778@mail.gmail.com>
	<200606120303.k5C33wIi002802@hiauly1.hia.nrc.ca>
	<119aab440606112013s71bc1daen46041756ce843d14@mail.gmail.com>
	<20060612060123.GB24813@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 parisc-linux@lists.parisc-linux.org
To: "Grant Grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060612060123.GB24813@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 6/12/06, Grant Grundler <grundler@parisc-linux.org> wrote:
> On Sun, Jun 11, 2006 at 11:13:33PM -0400, Carlos O'Donell wrote:
> > Reading the thread register is a single mfctl, I don't know if that is
> > considered slow?
>
> I believe it depends on the source of the "Move From".
> But I can't find a table with timing info. (e.g. mfctl CR16).

The thread register is CR27, the code to read the value is:

54 static inline struct _pthread_descr_struct * __get_cr27(void)
55 {
56   long cr27;
57   asm ("mfctl %%cr27, %0" : "=r" (cr27) : );
58   return (struct _pthread_descr_struct *) cr27;
59 }

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
