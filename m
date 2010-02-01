From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: futex wait failure
Date: Mon, 1 Feb 2010 07:58:56 -0500
Message-ID: <119aab441002010458g25373efex418886aca95ff4bd@mail.gmail.com>
References: <4B65F2AD.3060408@gmx.de>
	 <20100201002612.F0A754EA9@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Helge Deller <deller@gmx.de>, dave.anglin@nrc-cnrc.gc.ca,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100201002612.F0A754EA9@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Jan 28, 2010 at 11:56 AM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> >> Actually I did tested this with the minifail test program, and ch=
anged
>> >> thread_run() to call _exit(0) at the end instead of "return 0":
>> >> void* thread_run(void* arg) {
>> >> =A0 =A0 =A0 =A0 ...
>> >> /* =A0 =A0 =A0return (void *)&status; =A0*/
>> >> =A0 =A0 =A0 =A0 _exit(0);
>> >> }
>> >> With strace I then suddenly got exit_group() which seems more cor=
rect:
>> >> [pid =A01910] write(1, "Thread OK.\n", 11) =3D 11
>> >> [pid =A01910] exit_group(0) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D ?
>
> Did this fix minifail?

Do you have a copy of minifail I can run as a contained test case?

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
