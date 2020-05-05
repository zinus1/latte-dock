/*
*  Copyright 2020 Michail Vourlakos <mvourlakos@gmail.com>
*
*  This file is part of Latte-Dock
*
*  Latte-Dock is free software; you can redistribute it and/or
*  modify it under the terms of the GNU General Public License as
*  published by the Free Software Foundation; either version 2 of
*  the License, or (at your option) any later version.
*
*  Latte-Dock is distributed in the hope that it will be useful,
*  but WITHOUT ANY WARRANTY; without even the implied warranty of
*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
*  GNU General Public License for more details.
*
*  You should have received a copy of the GNU General Public License
*  along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.0

import org.kde.latte.abilities.definitions 0.1 as AbilityDefinition

AbilityDefinition.ParabolicEffect {
    id: parabolic
    property Item bridge: null
    readonly property bool isActive: bridge !== null

    factor: ref.parabolic.factor

    readonly property AbilityDefinition.ParabolicEffect local: AbilityDefinition.ParabolicEffect {}

    Item {
        id: ref
        readonly property Item parabolic: bridge ? bridge.parabolic.host : local
    }

    onIsActiveChanged: {
        if (isActive) {
            bridge.parabolic.client = parabolic;
        }
    }

    Component.onCompleted: {
        if (isActive) {
            bridge.parabolic.client = parabolic;
        }
    }

    Component.onDestruction: {
        if (isActive) {
            bridge.parabolic.client = null;
        }
    }
}
