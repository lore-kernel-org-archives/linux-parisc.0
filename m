Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from server1.neuronet.pitt.edu (server1.neuronet.pitt.edu [150.232.128.42])
	by dsl2.external.hp.com (Postfix) with ESMTP id 359FB484C
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Jun 2002 13:29:19 -0600 (MDT)
Received: from neuronet.pitt.edu (pink.neuronet.pitt.edu [150.232.130.105])
	by server1.neuronet.pitt.edu (8.8.8/8.8.8) with ESMTP id PAA04906
	for <parisc-linux@lists.parisc-linux.org>; Fri, 7 Jun 2002 15:29:44 -0400 (EDT)
Message-ID: <3D01098A.4080007@neuronet.pitt.edu>
Date: Fri, 07 Jun 2002 15:29:14 -0400
From: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Sources browsing tool?
References: <1023470637.3d00ec2d3a708@webmail.tiscalinet.be>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

joel.soete@freebel.net wrote:
> Hi all,
> 
> Can you advise me some browsing tools which would allowing me to find quickly
> where a variable, a function is define; where is used,... in this big amount
> source which represent kernel now (find is not always easy).
> 
> I find well a work of reverse engineering (rigiedit) of the kernel but not for 2.4.
> And unfortunately sources (tcl/tk iirc) do not seems to be available to port on
> hppa.

If you are using Emacs as your editor, you could use TAGS to locate 
definitions, etc.
This script may need editing:

##
# Build an ETAG file of the linux kernel sources.
ARCH=parisc

find arch/$ARCH drivers fs include/{asm-$ARCH,linux,net,scsi,video} \
      init ipc kernel lib mm net -name '*.[chS]' -print | sort | etags -
##

I used this quite a while ago, when I was writing a driver. You will 
need to consult the emacs manual on how to use tags.
-- 
     Rafael
