Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel12.hp.com (palrel12.hp.com [156.153.255.237])
	by dsl2.external.hp.com (Postfix) with ESMTP id 71253482A
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Feb 2002 11:48:54 -0700 (MST)
Received: from mailhub.rose.hp.com (mailhub.rose.hp.com [15.96.64.24])
	by palrel12.hp.com (Postfix) with ESMTP id 0DDA8600190
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Feb 2002 10:48:51 -0800 (PST)
Received: from ros-saab.rose.hp.com (ros-saab.rose.hp.com [15.43.213.64]) by mailhub.rose.hp.com with ESMTP (8.7.1/8.7.3 SMKit7.02) id KAA17050 for <parisc-linux@lists.parisc-linux.org>; Fri, 8 Feb 2002 10:48:48 -0800 (PST)
Received: from localhost (localhost [[UNIX: localhost]])
	by ros-saab.rose.hp.com (8.11.1/8.11.1) id g18Ikiv03649
	for parisc-linux@lists.parisc-linux.org; Fri, 8 Feb 2002 10:46:44 -0800
Message-Id: <200202081846.g18Ikiv03649@ros-saab.rose.hp.com>
Content-Type: text/plain;
  charset="iso-8859-1"
From: Paul Telford <paul_telford@hp.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] apache weirdness
Date: Fri, 8 Feb 2002 10:46:44 -0800
References: <200202071910.g17JAxv11007@ros-saab.rose.hp.com> <200202081715.g18HFqq03560@ros-saab.rose.hp.com> <20020208172606.C22440@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20020208172606.C22440@parcelfarce.linux.theplanet.co.uk>
MIME-Version: 1.0
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

On Friday 08 February 2002 9:26 am, Matthew Wilcox wrote:
> <puts on apache maintainer's cap>
> In the apache-dev package, there's /usr/sbin/apache.dbg which is an
> unstripped binary you can use to debug problems like this.

I wasn't able to make much progress trying to debug, since my copy of the 
source didnt match up with apache.dbg.  So I used apt-get to get the latest 
source, recompiled and the problem is gone.  So maybe there is some 
incompatibility between my system and the one used to compile the binary .deb 
package...  anyway, problem solved, relatively painlessly.  Thanks for the 
help....


 Paul.
