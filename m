Return-Path: <hppa-linux@puffingroup.com>
Date: Wed, 10 Feb 1999 14:09:00 -0500 (EST)
From: Alex deVries <adevries@redhat.com>
To: hppa-linux@puffingroup.com
Subject: Re: [hppa-linux] General port design questions
In-Reply-To: <199902101744.JAA19818@gatekeeper.equator.com>
Message-ID: <Pine.LNX.3.96.990210140648.9136D-100000@devserv.devel.redhat.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Resent-Message-ID: <"JGn0G2.0.Ef2.NGVms"@burrow.puffingroup.com>
Reply-To: hppa-linux@puffingroup.com
List-Id: linux-parisc.vger.kernel.org



On Wed, 10 Feb 1999, Jason Eckhardt wrote:
>    My vote is to not worry about HP-UX compatibility. Others will probably

I'd agree with that, however, I think we can set things up so that we
can leave room for HPUX compatibility at no cost. 

The priority here isn't to provide HPUX compatibility, but to get a
working system.  Let's not preclude the possibility of HPUX binary
compatibility later.

- Alex

-- 
Alex deVries <puffin@redhat.com>     
Red Hat Contrib Net maintainer          
Ottawa, Canada  
HPPA/Linux Porting Team



----------------------------------------------------------------------
To unsubscribe: send e-mail to hppa-linux-request@puffingroup.com with
`unsubscribe' as the subject.
