Received: from mx0a-00617f01.pphosted.com (mx0a-00617f01.pphosted.com [205.220.165.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E724217D6
	for <linux-parisc@vger.kernel.org>; Wed,  7 Oct 2026 00:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791331697; cv=none; b=ZcFCoKS2NQm+mfAumAyOMw/0e6j4e3DEzvACQBKQQpNC6REAmj7AdJGUtjjaX9T3NlYjQNvb3TMFsIPttfrR4m8zZIXolqS0BifTQmMi1X6ALF6rJkeh5DZ2WjHy0TI38JdJGNg4ZLQT0kdJqlgBR1CUumHlosMHvkUYh7OUQ74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791331697; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SdFBJfS6ctWe53K5QfaSJgm0NWZZigXQw26H7EfdkZR61Kut6YCNGyNWGs/dh1Q7wdYUrUTqAuz40YzEWkd/iQNJ1SW2EB1o0wK6z25dFIZxjE9+HFliXEehckW5d25DMuIlJSfAEVZifx3DADNWUIJ5A13uwe/8Ip9PWAbZ4fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=psmicorp.com; spf=pass smtp.mailfrom=psmicorp.com; arc=none smtp.client-ip=205.220.165.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=psmicorp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=psmicorp.com
Received: from pps.filterd (m0247527.ppops.net [127.0.0.1])
	by mx0a-00617f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69700GeG3310426
	for <linux-parisc@vger.kernel.org>; Tue, 6 Oct 2026 20:08:14 -0400
Received: from egc-exch2.psmicorp.com (webmail.psmicorp.com [38.142.134.66] (may be forged))
	by mx0a-00617f01.pphosted.com (PPS) with ESMTPS id 4h5b5e00qf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-parisc@vger.kernel.org>; Tue, 06 Oct 2026 20:08:14 -0400 (EDT)
Received: from EGC-EXCH2.psmicorp.com (10.1.1.111) by EGC-EXCH2.psmicorp.com
 (10.1.1.111) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Tue, 6 Oct
 2026 17:55:51 -0400
Received: from psmicorp.com (10.1.1.107) by EGC-EXCH2.psmicorp.com
 (10.1.1.111) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.1.2507.61 via Frontend
 Transport; Tue, 6 Oct 2026 17:55:50 -0400
Reply-To: <greg@gospelmusicuniversity.com>
From: Evans Thomas <_us@psmicorp.com>
To: <linux-parisc@vger.kernel.org>
Subject: fund transfer opportunity,Reply..
Date: Tue, 6 Oct 2026 23:55:47 +0200
Message-ID: <20261006235547.F1B7E96AF4F91DB9@psmicorp.com>
Precedence: bulk
X-Mailing-List: linux-parisc@vger.kernel.org
List-Id: <linux-parisc.vger.kernel.org>
List-Subscribe: <mailto:linux-parisc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-parisc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: MqgBukb34CMuEHAVJGrp3e2Emzys04Ut
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAwMCBTYWx0ZWRfXxy1952N/2K44
 NB74IafFe0Q4PvAnojUkQl99YO1pgZBXbRapR34sjnXfc0h4G7FGIQMegMBl2e5yMdV+IjG6Aad
 ZYBYGY71jAGLk7BX9mwVZJUTmpeBl1ez5AVJWtIgsJAcTh86AIKgbe9cnsSJurzsPTNT4tWPSXJ
 oe7fNvrQH1fANxqDyGjc/M9/Yvc1qaDCPtCXpICASkzjzSMrmD+jjC8K/krJOxvX8Gu25jYkR3k
 RxHaXJxHjlb+nJSqtU47w0csBDHVM7qC29eujj+W3p7hpTj0P/K+ORcPDWwUXTYK13KhkAs7qU8
 ssWRKzmBq/Saqynl2afMmkNY0y4g0aPsPKqhZ5D6i0imAhKdtJbYqTmH1lxxpGBLOn7UV1svG9y
 iHrXFwB2TdfbSTV09YwgASzrfLG7jmP2a8wwogxds5LtaZ2+RwisG6cQbNwV5x5GEbPZi/R+1mt
 OV0Ak32+JbgtkCgHXcw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAwMCBTYWx0ZWRfX8rJZH2KogKHL
 +BmfJ8sdSDD56gkYj1oSZdAHzmaF4FJucAUV4NUogaQ6xNzqb4m3hCTs8fz13q9v8O2LeCmJ+UB
 Jy7SyAtFAQV5rRN/IikO8zol389mCI69I9H0NJn12enaYee3goqh
X-Authority-Analysis: v=2.4 cv=GvTXaU1C c=1 sm=1 tr=0 ts=6ac58d6e cx=c_pps
 a=sNj4pI0fii9qGHoVqNzRVg==:117 a=sNj4pI0fii9qGHoVqNzRVg==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=ZHGAjPH774soz-f4Le74:22
 a=GfZueQGhKz3ujf-POmTq:22 a=tclcd6dtLQvEqt9_mmAA:9
X-Proofpoint-ORIG-GUID: MqgBukb34CMuEHAVJGrp3e2Emzys04Ut
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610070000

