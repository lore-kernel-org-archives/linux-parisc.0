Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from web12503.mail.yahoo.com (web12503.mail.yahoo.com [216.136.173.195])
	by dsl2.external.hp.com (Postfix) with SMTP id 3E3D34829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 30 Sep 2002 16:29:22 -0600 (MDT)
Message-ID: <20020930222919.62918.qmail@web12503.mail.yahoo.com>
Date: Mon, 30 Sep 2002 15:29:19 -0700 (PDT)
From: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] hardware newbie question...
To: Stephen J de Vries <paulhill20@juno.com>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020925.090915.-178139.3.paulhill20@juno.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

What do you mean locked down?  Boot the thing single user and delete
the password.  At the "Press any key to interrupt boot" prompt stop the
boot.  Type BO <enter> interact with ISL? <y> <enter>.  Then at the isl
prompt type <hpux -is> <enter>.  That will get you into single user
mode.  Unless the system is setup in trusted mode you should be able to
get in and modify the /etc/passwd file.  The user name should come
first followed by the password that is encrypted within the colons
(ex:root:VDTGE$8757474:).  Delete the encrypted stuff but leave the
colons and save it.  Reboot it in multiuser mode and root shouldn't
have a password.

derek


--- Stephen J de Vries <paulhill20@juno.com> wrote:
> I have a HP 712 that I'd purchased recently.
> 
> My question is:
> 
> Can I use a PC monitor, keyboard, and mouse to boot the thing up?  If
> so,
> does the monitor have to be a multisync or something special?
> 
> In addition, HP-UX is on the hard drive but is locked down.  I was
> thinking of buying an external CD drive and attempting to load debian
> 0.93.  Can anyone recommend a place to buy the CD drive that they
> have
> dealt with?  I also have a network so I could attempt a network
> install
> but I am not sure what minimum requirements I'd need to fulfill for
> that.
>  Is my approach the right one?
> 
> Thanks for the advice...
> 
> Stephen de Vries
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux


__________________________________________________
Do you Yahoo!?
New DSL Internet Access from SBC & Yahoo!
http://sbc.yahoo.com
