From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: parisc: unwind tables and backtraces broken?
Date: Tue, 7 Jul 2009 16:36:14 -0400
Message-ID: <119aab440907071336y707c18f7pf442349c2e232fa7@mail.gmail.com>
References: <4A538D8A.70002@gmx.de>
	 <20090707183311.6B5AA4FB2@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Helge Deller <deller@gmx.de>, randolph@tausq.org,
	linux-parisc@vger.kernel.org, dave.anglin@nrc-cnrc.gc.ca
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090707183311.6B5AA4FB2@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Jul 7, 2009 at 2:33 PM, John David
Anglin<dave@hiauly1.hia.nrc.ca> wrote:
>> Interestingly, this problem showed up to me now since I updated my 3=
2- and
>> 64bit crosscompilers to 4.3.3 (and binutils of course).
>> I used (on 32bit) the gcc-3.3 before and this one doesn't exibited t=
he
>> problem of buggy unwind tables (with the existing/same kernel source=
 code).
>
> GCC doesn't know anything about PA-RISC unwind info. =A0It's generate=
d by the
> assembler from assembler directives. =A0So, I think it's unlikely tha=
t the
> problem is in GCC.
>
> Your comments about dead-code elimination by the linker make me wonde=
r
> if that isn't the problem.

Helge,

Are you compiling with --gc-sections? Try without?

I've seen at least one problem in the past on another target where
garbage collection would not correctly update debug information.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
