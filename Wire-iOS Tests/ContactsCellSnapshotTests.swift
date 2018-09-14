//
// Wire
// Copyright (C) 2018 Wire Swiss GmbH
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program. If not, see http://www.gnu.org/licenses/.
//

import XCTest
@testable import Wire

final class ContactsCellSnapshotTests: ZMSnapshotTestCase {

    var sut: ContactsCell2!
    let buttonTitles = ["contacts_ui.action_button.open".localized,
                        "contacts_ui.action_button.invite".localized,
                        "connection_request.send_button_title".localized]

    override func setUp() {
        super.setUp()
        sut = ContactsCell2()


        sut.allActionButtonTitles = buttonTitles

        /// TODO: remove this after snapshot is created
        recordMode = true
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testForInviteButton() {

        let user = MockUser.mockUsers()[0]
        sut.user = user

        sut.actionButton.setTitle(buttonTitles[1], for: .normal)

        verify(view: sut.prepareForSnapshots())
    }

    func testForOpenButton() {

        let user = MockUser.mockUsers()[0]
        sut.user = user

        sut.actionButton.setTitle(buttonTitles[0], for: .normal)

        verify(view: sut.prepareForSnapshots())
    }
}