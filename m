Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9DD8B482A
	for <parisc-linux@parisc-linux.org>; Sat, 30 Mar 2002 13:10:27 -0700 (MST)
Date: Sat, 30 Mar 2002 15:11:30 -0500
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org, will@misconception.org.uk
Subject: Re: [parisc-linux] Re: Fwd: Re: Any hppa gurus?
Message-ID: <20020330151130.B16616@systemhalted>
References: <20020330104724.A16468@systemhalted> <200203301736.g2UHaAic028252@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200203301736.g2UHaAic028252@hiauly1.hia.nrc.ca>; from dave@hiauly1.hia.nrc.ca on Sat, Mar 30, 2002 at 12:36:09PM -0500
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> 
> No.  Although it might seem that you could pass 4 floats and 4 ints, this
> is not done.  The 32-bit linux ABI is exactly the same as the 32-bit hpux ABI
> except that argument relocations aren't done.  There are situations (e.g.,
> indirect calls) where an argument is passed in both general and floating
> registers under hpux because the linker doesn't know how to relocate
> the arguments for the call.  Thus, you can't use gr24 for an int argument
> and fr5 for a different float argument.
> 
> This isn't going to change as changing the ABI would require recompilation
> of everthing, as well as modifications to gcc, binutils, gdb and the
> runtime documentation.  You can find the HP runtime documents here:
> <http://h21007.www2.hp.com/dspp/tech/tech_TechTypeListingPage_IDX/1,1704,10403,00.html>.
>

It's clear that you can't pass 8 words, since the 32-Bit ABI says that
only the first 4 words are passed in registers as parameters for a function (2-26).

I'm not sure what's implied by the need for 4 words of "spill over" in the stack
for the first 4 arguments to the function call.

int,int,float produces:

	Produced	Produced		Expected

	int	gr26	fr7	-----		===	float
	int	gr25	fr6	float		===	-----
	---	gr24	fr5	-----		---	-----
	---	gr23	fr4	-----		---	-----

int,float,int produces:

	Produced	Produced		Expected

	int	gr26	fr7	-----		===	float
	---	gr25	fr6	-----		int	-----
	int	gr24	fr5	float		---	-----
	---	gr23	fr4	-----		---	-----

int,float,double produces:

	Produced	Produced		Expected

	int	gr26	fr7	double		===	float
	---	gr25	fr6	+++		---	---
	---	gr24	fr5	float		---	double
	---	gr23	fr4	---		---	+++


I generally read from the 274 Page pdf HPUX 11.00 v1.0
 "The 32-Bit PARISC Run-Time Architecture Document"

It's become a little game lately ;) I build some code, and try to 
second guess what the .s file will contain... and I'm usually wrong.
Which just means that I need to start looking at more code to see
how things were implemented.


Lately I was thrown by the call to printf (vararg):

char*,int,double,int,float,int,float:

	Produced		Produced	

        char		gr26	fr7	doubleH
        int		gr25	fr6	doubleL
        doubleH		gr24	fr5	-----
        doubleL		gr23	fr4	-----

Which really leaves me scratching my head, since gr24 and gr23
shouldn't be used for relocation in this case? I guess varargs
are another cute case :}

--

Re: New ABI -> Possibly minimal perforamnce increase, and loss of HPUX compatibility.
