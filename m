Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hauptpostamt.charite.de (hauptpostamt.charite.de [193.175.73.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id EE12E4842
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Mar 2002 03:12:25 -0700 (MST)
Date: Mon, 18 Mar 2002 11:12:23 +0100
From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
To: Jean-Louis Abat <jl_abat@hotmail.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] pb with iso 0.9.3 ?
Message-ID: <20020318101223.GI31276@charite.de>
References: <DAV39FlmmlQ080Gxw8Z0001bdbc@hotmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <DAV39FlmmlQ080Gxw8Z0001bdbc@hotmail.com>
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

On Mon, Mar 18, 2002 at 11:05:24AM +0100, Jean-Louis Abat wrote:
> Hi, 
> 
> I made an installation with the 0.9.3 iso on 3 different types of
> parisc systems : 715/33,720/50 and 712/80. As I haven't much time to
> do so, I decide to use only tasksel, and not dselect. The pb was the
> same under 715 and 720 : no X, but it is ok with the 712... (of
> course, I've modified the XF86Config for all, using fbdev as driver,
> and using a serial mouse and a hil keyboard for the 715 and 720 with
> the good keymap...) What could be the problem? Are 715 and 720
> working under X ??

Yes, definitely. X is fine on my 712/80. The config was posted here,
check the Archives.


-- 
Ralf Hildebrandt (Im Auftrag des Referat V A)   Ralf.Hildebrandt@charite.de
Charite Campus Virchow-Klinikum                 Tel.  +49 (0)30-450 570-155
Referat V A - Kommunikationsnetze -             Fax.  +49 (0)30-450 570-916
Why is Linux so stable? 
Because Penguins can't fly.
