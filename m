Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sj-msg-core-4.cisco.com (sj-msg-core-4.cisco.com [171.71.163.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9C460482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  1 Jan 2002 21:38:51 -0700 (MST)
Date: Tue, 1 Jan 2002 20:38:48 -0800
From: Christian Suder <csuder@cisco.com>
To: "Nick Papadonis" <npapadon@yahoo.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] DISREGARD 0.9.3 installer didn't set 712 bootable
Message-Id: <20020101203848.1634246f.csuder@cisco.com>
In-Reply-To: <m3u1u5fkmw.fsf@localhost.localdomain>
References: <m3y9jhfmrn.fsf@localhost.localdomain>
	<m3u1u5fkmw.fsf@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On 01 Jan 2002 23:21:27 -0500
"Nick Papadonis" <npapadon@yahoo.com> wrote:
> 
> One other thing I noticed, is that more then 4 partitions couldn't be
> created on my 2 gigabyte drive.  The disk partition utility informs
> that the unused space is 'unusable'?
> 

The standard fdisk utility in Linux is pretty PC-ish, so you can only have
4 primary partitions. However you can create one of them as "extended"
partition, and within this partition you can create additional ones,

	Christian 
