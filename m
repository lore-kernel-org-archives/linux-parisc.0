From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: futex wait failure
Date: Mon, 18 Jan 2010 15:49:43 -0500
Message-ID: <119aab441001181249v596d90e2ibb0e0815ea5fe009@mail.gmail.com>
References: <4B524912.4070204@gmx.de>
	 <20100118204459.B95514EF1@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Helge Deller <deller@gmx.de>, dave.anglin@nrc-cnrc.gc.ca,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100118204459.B95514EF1@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Jan 18, 2010 at 3:44 PM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> Actually I did tested this with the minifail test program, and chang=
ed
>> thread_run() to call _exit(0) at the end instead of "return 0":
>> void* thread_run(void* arg) {
>> =A0 =A0 =A0 ...
>> /* =A0 =A0return (void *)&status; =A0*/
>> =A0 =A0 =A0 =A0 =A0_exit(0);
>> }
>> With strace I then suddenly got exit_group() which seems more correc=
t:
>> [pid =A01910] write(1, "Thread OK.\n", 11) =3D 11
>> [pid =A01910] exit_group(0) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D ?
>
> The child of the fork should exit using _exit(0). =A0Otherwise, it me=
sses
> with the file descriptors of the parent.

Thanks for verifying this. I'm looking into this.

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
