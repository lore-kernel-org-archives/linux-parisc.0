From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] a small hunk to cleanup 2 build warning?
Date: Fri, 24 Mar 2006 17:58:27 +0100
Message-ID: <200603241758.28042.deller@gmx.de>
References: <IWMZGK$A7E56C1F2E8CACD0CB61C6EEBA1DB197@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <IWMZGK$A7E56C1F2E8CACD0CB61C6EEBA1DB197@scarlet.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Joel,

thank you for the patch.
I just looked how it is fixed currently in Linus' (>2.6.16) tree, and there this was added to include/linux/compat.h.
Since I don't think we will push the changes you propose to 2.6.16 in the file compat_siginfo.h upstream (since it has been fixed differently), I think it's easier to just stick with this small warning at the moment.
If others here think differently just go ahead...

Regards,
Helge

On Friday 24 March 2006 15:41, Joel Soete wrote:
> Hi pa*,
> 
> those 2 warning crossed my look during the build of n4k (64bit) smp kernel (in
> a loop to stress it a bit):
>   CC      kernel/compat.o
> /usr/src/linux-2.6.16-pa4/kernel/compat.c: In function 'compat_sys_timer_create':
> /usr/src/linux-2.6.16-pa4/kernel/compat.c:531: warning: implicit declaration
> of function 'get_compat_sigevent'
> [...]
>   CC      ipc/compat_mq.o
> /usr/src/linux-2.6.16-pa4/ipc/compat_mq.c: In function 'compat_sys_mq_notify':
> /usr/src/linux-2.6.16-pa4/ipc/compat_mq.c:113: warning: implicit declaration
> of function 'get_compat_sigevent'
> [...]
> 
> imho this simple hunk could be helpfull:
> --- ./include/linux/compat_siginfo.h.Orig       2006-03-24 14:04:10.000000000
> +0100
> +++ ./include/linux/compat_siginfo.h    2006-03-24 14:24:49.000000000 +0100
> @@ -171,6 +171,9 @@
>  
>  #endif /* !HAVE_ARCH_COMPAT_COPY_SIGINFO */
>  
> +extern int get_compat_sigevent(struct sigevent *event,
> +                       const struct compat_sigevent __user *u_event);
> +
>  extern int compat_copy_siginfo_to_user(compat_siginfo_t __user *to, struct
> siginfo *from);
>  extern int compat_copy_siginfo_from_user(struct siginfo *to, compat_siginfo_t
> __user *from);
>  
> ====<>====
> 
> If Ok can you ci?
> 
> TIA,
>     Joel
> 
> -------------------------------------------------------
> NOTE! My email address is changing to ... @scarlet.be
> Please make the necessary changes in your address book. 
> 
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
