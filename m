From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re:[parisc-linux] "BUG: soft lockup detected on CPU#0" on recent
	64bit k-2.6.16 (up or smp)
Date: Fri, 31 Mar 2006 16:41:56 +0100
Message-ID: <IX00XW$54609265F67FD22980DB5BAA9486A0DB@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>,
 tsg45800 <tsg45800@scarlet.be>
To: "soete.joel" <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello pa*,
> 
[snip]
> 
> also noticed on n4k runing k-2.6.16-pa0 64bit smp kernel:
> BUG: soft lockup detected on CPU#0!
> 
[...]
>  IAOQ[0]: _read_lock+0x18/0x30
>  IAOQ[1]: _read_lock+0x8/0x30
>  RP(r2): send_group_sig_info+0x3c/0xb0
> 
This kind of hung re-occured on this n4k (64bit smp kernel 2.6.16-pa8);

I just grab the piminfo but useless:
[...]
Parse IAOQ =3D 0x000000ffff80ff3c for CPU[1]

Func: _end, Off: 0xffef1f1244, Addr: 0xffff80ff3c
[...]

Parse IAOQ =3D 0x00000000000006c4 for CPU[3]

[...]

Sorry,
    Joel

PS: I just start the same test but without CONFIG_DETECT_SOFTLOCKUP :<?
=0A=0A---------------------------------------------------------------=0AA=
 free anti-spam and anti-virus filter on all Scarlet mailboxes=0AMore inf=
o on http://www.scarlet.be/

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
