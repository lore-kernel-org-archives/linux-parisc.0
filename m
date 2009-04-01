From: Alexander Beregalov <a.beregalov@gmail.com>
Subject: Re: compile failure with LEDs
Date: Wed, 1 Apr 2009 13:46:14 +0400
Message-ID: <a4423d670904010246h4c95d10p3cc10e2771819351@mail.gmail.com>
References: <Pine.SOC.4.64.0904011105510.26377@math.ut.ee>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc@vger.kernel.org
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <Pine.SOC.4.64.0904011105510.26377@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

2009/4/1 Meelis Roos <mroos@linux.ee>:
> FYI - todays 2.6.29+git:
>
> =C2=A0CC =C2=A0 =C2=A0 =C2=A0drivers/parisc/led.o
> drivers/parisc/led.c: In function 'led_create_procfs':
> drivers/parisc/led.c:246: error: 'struct proc_dir_entry' has no membe=
r named 'owner'
> drivers/parisc/led.c:252: error: 'struct proc_dir_entry' has no membe=
r named 'owner'
> drivers/parisc/led.c:261: error: 'struct proc_dir_entry' has no membe=
r named 'owner'
> make[3]: *** [drivers/parisc/led.o] Error 1

http://patchwork.cabal.ca/patch/544/
this patch should fix it
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
