From: =?ISO-8859-1?Q?Thibaut_VAR=C8NE?= <T-Bone@parisc-linux.org>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Sun, 2 May 2010 12:53:37 +0200
Message-ID: <B68FAE03-5BDE-4CE2-9AEA-42FECA2FD6CD@parisc-linux.org>
References: <20100501201715.44ABB515D@hiauly1.hia.nrc.ca>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed	delsp=yes
Cc: dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100501201715.44ABB515D@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Le 1 mai 10 =E0 22:17, John David Anglin a =E9crit :
>
> Regarding the wiki, it's a useful summary.  However, #561203 (minifai=
l
> bug) is not a "Futex wait failure".  We may have futex bugs, but I'm =
=20
> not
> aware of a testcase.  The minifail bug is a "Threads and fork" proble=
m
> arising from cache corruption.  Mainly, copy_user_page is broken when
> copying memory shared by more than one process.  There are also issue=
s
> in PTE/TLB management on SMP systems.  Probably, the vfork/execve bug
> is caused by the same problem.


Many thanks for the feedback. The reason why I initially put the =20
minifail bug under "Futex wait failure" was because I found it =20
discussed under such a thread ;-)

I've merged this section under "Threads & fork", and have quoted your =20
summary at the top of the section.

HTH

T-Bone

--=20
Thibaut VAR=C8NE
http://www.parisc-linux.org/~varenet/

--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
