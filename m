Return-Path: <grundler@lackof.org>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id DD1054854
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 26 Apr 2004 11:11:27 -0600 (MDT)
Date: Mon, 26 Apr 2004 11:11:26 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Message-ID: <20040426171126.GE23029@colo.lackof.org>
References: <408D3DDB00000005@ocpmta1.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <408D3DDB00000005@ocpmta1.freegates.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: [parisc-linux] Re: kernel>=2.6.4-rc3 hung or panic on C1[18]0
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, Apr 26, 2004 at 06:52:40PM +0200, Joel Soete wrote:
> and here cmd is a "Scsi_Cmnd *" which is so of different type because of
> "typedef struct scsi_cmnd Scsi_Cmnd"

uhm...the typedef says Scsi_Cmnd *IS* struct scsi_cmnd.
Therefor "Scsi_Cmnd *"  is the same type as "struct scsi_cmnd *".

> What should it be done?

Get rid of Scsi_Cmnd typedef?
I personally consider it bad style to use both forms in the same
subsystem and don't really care which is used. But that's an
issue for the subsystem maintainer to decide. :^)

grant
