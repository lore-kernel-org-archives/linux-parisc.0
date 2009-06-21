From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Segfault in __c_f_f_c during strace of nptl application.
Date: Sun, 21 Jun 2009 16:01:04 -0400
Message-ID: <119aab440906211301sf3b549dtd2a29839e86d4bfe@mail.gmail.com>
References: <119aab440906210918v7ff1420cvb1c45fcf518419f8@mail.gmail.com>
	 <20090621171701.3040B4EE8@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090621171701.3040B4EE8@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Jun 21, 2009 at 1:16 PM, John David
Anglin<dave@hiauly1.hia.nrc.ca> wrote:
>> The move of the fptr into r26 is moved before the call to umove, the=
n
>> umove clobbers r26, then __c_f_f_c is called and crashes.
>
> This needs a GCC bug report. =A0It an important defect. =A0As usually=
,
> preprocessed source is needed and compiler version. =A0The version of
> strace in lenny/testing doesn't have any calls to __c_f_f_c.

Sorry, this turns out not to be correct, after tracing the assembly
completely (including loads in delayed branches) it looks like the
location read from the pid through ptrace might be wrong. I'll have to
keep debugging this.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
