Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from osiris.silug.org (osiris.silug.org [64.240.156.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id B5B5D4829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 15 Jan 2003 09:31:58 -0700 (MST)
Date: Wed, 15 Jan 2003 10:31:57 -0600
From: Steven Pritchard <steve@silug.org>
To: "Martin K. Petersen" <mkp@mkp.net>
Cc: jsoe0708@tiscali.be, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PA-RISC Linux RAID1 Root HOWTO
Message-ID: <20030115163157.GA16579@osiris.silug.org>
References: <3E1AA7C1000015EB@ocpmta7.freegates.net> <yq1fzru4bwv.fsf@austin.mkp.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <yq1fzru4bwv.fsf@austin.mkp.net>
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

On Wed, Jan 15, 2003 at 11:26:24AM -0500, Martin K. Petersen wrote:
> If I recall correctly, the ext3fs resizer isn't quite ready yet.  So
> you may have to convert your filesystem back to ext2, resize it, and
> then turn journalling back on.

resize2fs (included in e2fsprogs) works fine on ext3.

Steve
-- 
steve@silug.org           | Southern Illinois Linux Users Group
(618)398-7360             | See web site for meeting details.
Steven Pritchard          | http://www.silug.org/
